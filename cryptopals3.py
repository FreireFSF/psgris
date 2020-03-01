#"Função é  uma sequência de instruções que computa um ou mais resultados que chamamos de parâmetros" -- Apostila python e orientação a objetos
# def nome_de_funcao(parametro1,parametro2):
#    aqui digita os comandos
#   deve sempre retornar algo

def keyxor(mensagem, key): # crio a função keyxor que pede como parametros uma mensagem e a chave quando chamadas

    cipher =b'' #cria uma string vazia que é byte object
    index=0 #cria a variavel index e a starta em zero
    for byte in mensagem:
        cipher += bytes ([byte ^ key[index]]) # cypher vai receber a cada vez (vai receber e somar com o próximo resultado)
        #o XOR de byte com a key[index] em bytes
        if (index +1) == len(key): #se o index mais um for igual ao tamanho da chave, o index é zerado, se não, vai para o else
            index = 0
        else: #ativado quando o index+1 é diferente do tamanho da chave, somando mais um no index.
            index +=1
    return cipher

def main():    
    frase= b"Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
    key =b"ICE" #O b na frente da string significa byte object, o que difere de uma string normal.
    
    ciphertext = keyxor(frase,key) #chama a função keyxor passando a frase e chave e armazenando o resultado em ciphertext
    print (ciphertext.hex()) #codifica em hex a criptografia com chave


if __name__ == "__main__": #uma verificação que o programa está sendo executado por si só
    main() ## o main() é a parte principal do código, seu "centro", onde os códigos são executados e apenas executando as funções 
    #se chamadas nele  





