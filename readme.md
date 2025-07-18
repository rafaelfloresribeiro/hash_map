Minha implementação de Hash_map, usando instruções seguindo OdinProject.

Para fins de exercício, essa linked list possui o funcionamento um pouco esquisito. É utilizado array como base para guardar os elementos,
mas estes elementos são colocados com a resolução de uma função hash que escolhe uma celula da array. Caso a celula seja colisão, o elemento
opera como linked_list e coloca como um next_node.

Mantém-se em memória a quantia de loops que já foram executados. Utilizando um load_factor de 75%, cálcula-se a quantia de loops
que devem ser executados antes de se dobrar o tamanho da array para operarmos nossos hashes. Quando atingido, dinâmicamente dobra-se o tamanho
da array e a hashing function automaticamente designa para os novos índices.

Utilize o i_love_pry para olhar por dentro da estrutura de arquivos.