import asyncio
import asyncpg


async def fetch_product_info(connection, product_id, semaphore=None):
    query = "SELECT * FROM products WHERE id = $1"
    task = connection.fetchrow(query, product_id)
    if semaphore:
        async with semaphore:
            result = await task
            return result

    return await task


async def main():
    db_pool = await init_db()
    try:
        products = [1, 2, 3, 4, 5]
        # async with db_pool as conn:
        tasks = [fetch_product_info(db_pool, product_id) for product_id in products]
        results = await asyncio.gather(*tasks)

        for result in results:
            print(result)
        print('*'*10)
        semaphore = asyncio.Semaphore(2)
        tasks = [fetch_product_info(db_pool, product_id, semaphore) for product_id in products]
        results = await asyncio.gather(*tasks)

        for result in results:
            print(result)
    finally:
        await db_pool.close()


async def init_db() -> asyncpg.Pool:
    dsn = "postgresql://testuser:testuser@db/test_db"
    return await asyncpg.create_pool(dsn)


if __name__ == "__main__":
    asyncio.run(main())
