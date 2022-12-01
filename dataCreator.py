import random
from os import system as sys

sys('rm ./in/*/*.csv')

possibleValues = list(range(0, 10000))
dataSizes = [20, 50, 100, 300, 500, 1000, 3000, 5000]
samplesNumber = 15
sample = []

for size in dataSizes:
    
    randomSamples = open(f'./in/random/{size}.csv', 'x')
    randomSamples.write(f'{size}\n')

    ascendingSamples = open(f'./in/ascending/{size}.csv', 'x')
    ascendingSamples.write(f'{size}\n')

    descendingSamples = open(f'./in/descending/{size}.csv', 'x')
    descendingSamples.write(f'{size}\n')

    for j in range(0, samplesNumber):

        sample = random.sample(possibleValues, size)

        for i in sample:
            randomSamples.write(f'{i}; ')
        randomSamples.write('\n')

    for j in range(0, samplesNumber):

        sample = random.sample(possibleValues, size)
        sample.sort()

        for i in sample:
            ascendingSamples.write(f'{i}; ')
        ascendingSamples.write('\n')

    for j in range(0, samplesNumber):

        sample = random.sample(possibleValues, size)
        sample.sort(reverse=True)

        for i in sample:
            descendingSamples.write(f'{i}; ')
        descendingSamples.write('\n')