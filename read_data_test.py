import asyncio
import time 

async def sum_one(x):
    for i in x:
        print(i)
        await asyncio.sleep(1)
        
async def loop(arr):
    while len(arr) > 0 :
        new_arr = arr[:50]
        # Aqui vou enviar o array de itens para a lambda
        task = asyncio.create_task(sum_one(new_arr))
        new_arr = []
        del arr[:50]
    #await task
    
        
async def main(x):
    task1 = asyncio.create_task(loop(x))
    await task1
    await asyncio.gather(*asyncio.all_tasks() - {asyncio.current_task()})
arr = []
for i in range(0, 51):
    arr.append(i)


asyncio.run(main(arr))