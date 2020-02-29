import codecs 
# No Python, podemos chamar pacotes pelo import
## O que são pacotes? uma junção de vários módulos, um "pacote" de módulos.
### O que são módulos? um script, um arquivo .py que também pode ser importado para outros módulos.
#### Sobre o import: import é como importamos módulos e pacotes para o código em questão, normalmente importa-se todo o pacote.
#### Como importar tudo de um pacote (uma das maneiras, a mais usual): import nome_do_pacote
##### Codecs: um pacote padrão de codecs(encodificadores e descodificadores). 
##### Exemplos de módulos codecs: codecs.encode(objeto_a_ser_codificado, para_qual_linguagem_ou_base_vai_codificar), 
##### codecs.decode(objeto_a_ser_descodificado, para_qual_linguagem_ou_base_para_qual_está_descodificando), codecs.lookup(codificação_que_procura_informações) e etc.

hexa = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
# Criei uma variável chamada hexa e dei como parâmetro aquilo que quero converter

bs64 = codecs.encode(codecs.decode(hexa, 'hex'), 'base64')
# Criei uma variável chamada bs64 que guarda o que foi feito: começando mais por dentro, o código  "codecs.decode(hex, 'hex')" descodifica a variavel hexa, que está em hex (hexadecimal),
# com seu resultado, o codecs.encode( RESULTADO, 'base64') roda codificando o recebido para a base 64.

print(bs64)
#Mostrei na tela o resultado da conversão\