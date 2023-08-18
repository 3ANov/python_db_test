import asyncio
import asyncpg


async def fetch_product_info(
        db_pool: asyncpg.Pool,
        product_id: int
) -> asyncpg.Record:
    async with db_pool.acquire() as connection:
        query = "SELECT * FROM products WHERE id = $1"
        return await connection.fetchrow(query, product_id)


async def fetch_product_info_with_semaphore(
        db_pool: asyncpg.Pool,
        semaphore: asyncio.Semaphore,
        product_id: int
) -> asyncpg.Record:
    async with semaphore:
        return await fetch_product_info(db_pool, product_id)


async def main():
    db_pool = await init_db()
    try:
        products = [1, 2, 3, 4, 5]
        tasks = [fetch_product_info(db_pool, product_id) for product_id in products]
        results = await asyncio.gather(*tasks)

        for result in results:
            print(result)
        print('*'*10)
        semaphore = asyncio.Semaphore(2)
        tasks = [fetch_product_info_with_semaphore(db_pool, semaphore, product_id) for product_id in products]
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
