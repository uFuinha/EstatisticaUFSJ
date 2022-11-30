import random
from os import system as sys

sys('rm ./in/*.csv')

possibleValues = list(range(0, 10000))
dataSizes = [20, 50, 100, 300, 500, 5000]
samplesNumber = 15
sample = []

for size in dataSizes:
    
    file = open(f'./in/{size}.csv', 'x')
    file.write(f'{size}\n')

    for j in range(0, samplesNumber):

        sample = random.sample(possibleValues, size)

        for i in sample:
            file.write(f'{i}; ')
        file.write('\n')