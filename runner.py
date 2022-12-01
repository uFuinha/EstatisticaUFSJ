import glob
import time

# Importação dos algoritmos de ordenação
from insertionSort import insertion_sort
from mergeSort import merge_sort

from dataCreator import samplesNumber as size

# Determinação dos arquivos de teste
randomSets = glob.glob('./in/random/*.csv')
ascendingSets = glob.glob('./in/ascending/*.csv')
descendingSets = glob.glob('./in/descending/*.csv')
sets = [randomSets, ascendingSets, descendingSets]
outs = ['./out/insertion/random.csv', './out/insertion/ascending.csv', './out/insertion/descending.csv']

o = 0
for set in sets:
    # Criação do buffer que armazenará os dados antes da escrita.
    buffer = [[] for i in range(0, size + 1)]

    # Para cada um dos caminhos
    for path in set:
        file = open(path, 'r')
        sequences = file.readlines()

        buffer[0].append(sequences[0].strip())

        for i in range(1, len(sequences)):
            sequence = sequences[i].split('; ')

            start = time.time()
            insertion_sort(sequence)
            end = time.time()

            buffer[i].append((end - start) * 100)

    # -----------------------------------------------------------

    # Para facilitar o tratamento da tabela de tempos, as
    # colunas podem ser escritas de acordo com a ordem 
    # crescente da quantidade de items nas sequências.

    # Para isso, basta ordenar a primeira linha do buffer,
    # armazenar os índices ordenados e escrever o arquivo de
    # acordo com essa .

    # Uma vez que essa etapa não será analisada no teste, 
    # utiliza-se a função de ordenação da própria linguagem.

    # -----------------------------------------------------------

    # Separação e ordenação, em um auxiliar, da primeira linha 
    orderAux = [int(n) for n in buffer[0]]
    orderAux.sort()

    # Determinação dos índices ordenados
    indexOrder = [buffer[0].index(str(i)) for i in orderAux]

    # Abertura do arquivo de saída
    output = open(outs[o], 'w')

    # Escrita dos dados
    for tuple in buffer:
        for i in indexOrder:
            output.write(f'{float(tuple[i]):.5f},')
        output.write('\n')

    o = o+1