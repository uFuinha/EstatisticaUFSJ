import glob
import time

# Importação dos algoritmos de ordenação
from mergeSort import merge_sort

from dataCreator import samplesNumber as size

# Determinação dos arquivos de teste
randomSets = glob.glob('./in/random/*.csv')
ascendingSets = glob.glob('./in/ascending/*.csv')
descendingSets = glob.glob('./in/descending/*.csv')
sets = [randomSets, ascendingSets, descendingSets]
outs = ['./out/merge/random.csv', './out/merge/ascending.csv', './out/merge/descending.csv']

o = 0
for set in sets:
    # Criação do buffer que armazenará os dados antes da escrita.
    buffer = [[] for i in range(0, size + 1)]

    # Para cada um dos caminhos
    for path in set:
        file = open(path, 'r')
        sequences = file.readlines()

        buffer[0].append(int(sequences[0].strip()))

        for i in range(1, len(sequences)):
            sequence = sequences[i].split('; ')
            aux = [0] * len(sequence)

            start = time.time()
            merge_sort(sequence, aux, 0, len(sequence) - 1)
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
    indexOrder = [buffer[0].index(i) for i in orderAux]

    # Abertura do arquivo de saída
    output = open(outs[o], 'w')

    # Escrita dos dados
    for tuple in buffer:
        for i in indexOrder:
            if buffer.index(tuple) == 0:
                output.write(f'{int(tuple[i])},')
            else:
                output.write(f'{float(tuple[i]):.5f},')
        output.write('\n')

    o = o+1