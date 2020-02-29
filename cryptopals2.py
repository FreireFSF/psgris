import codecs 

string = "1c0111001f010100061a024b53535009181c"
prime = codecs.decode(string, 'hex')
string2 = "686974207468652062756c6c277320657965"
segun = codecs.decode(string2, 'hex')
primeiro = list(prime) #conversão do tipo da variavel prime para lista, criando uma nova variavel para o armazenamento chamada primeiro
segundo = list(segun) #conversão do tipo da variavel segun para lista,  criando uma nova variavel para o armazenamento chamada segundo

xorlista= [] # criação de uma variavel que armazena uma lista vazia

for x in range(0,len(prime)): # um laço de repetição, for (para) x in (em) range(de_onde_começa, até_onde_vai) len: conta quantos caracteres a string tem
#logo, esse loop vai de 0 até a quantidade de caracteres de prime
    xor = hex(primeiro[x] ^ segundo[x]) # conta xor sendo feita em hex, hex(primeiro_argumento ^ segundo_argumento), enquanto roda a lista primeiro e segundo pelo loop
    xorlista.append(xor) #a cada volta dada, adiciona a lista (que declarei vazi acima) xorlista o resultado da conta XOR.
    #a cada volta, o x incrementa 1 em seu valor
resposta = ''.join(str(e) for e in xorlista) # transformo minha lista de volta em uma string, armazenada em resposta.

for i in range(0,len(resposta)): #Laço de repetição que roda a string
    resposta =resposta.replace("0x","") #replace serve para substituições, neste caso, estou tirando todos os 0x e colocando "vazio" no lugar dele
print(resposta)