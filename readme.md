Raciocionio


Hash_Map

Atualmente preciso implementar a função que muda dinâmicamente o tamanho do meu array. As regras do Odin não estão sendo necessárias
prestar atenção (no que diz respeito ao tamanho da array) pois já levamos isso em consideração ao escolher um índice.

Para a implementação do redimensionamento dinâmico, preciso ter em mente quantos **pares de chaves** foram adicionados ao meu array,
já que como uso uma implementação customizada de linked_list, viajar por dentro dos nódulos é uma operação a parte de navegar entre 
índices.

A forma inicial que pensei como redimensionar dinâmicamente os índices envolve o cálculo do número de vezes que pares podem ser introduzidos
como um número inteiro, tendo nosso objetivo redimensionar caso atinja 75% do tamanho da sua array inicial (12). Para saber quantas repetições
representam 75% de 12, basta... 75% de 12 = 9. Como será computacionalmente caro contar os índices todas as vezes que forem introduzidos,
podemos introduzir contador na classe HashMap que ficará responsável por saber em qual iteração estamos antes de redimensionar o array.

Em resumo:

loop_counter = @bucket.length * 0.75 - com uma unica casa decima

when loop >= loop_counter
re_hash the whole Hash_Map