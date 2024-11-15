# Como adicionar respostas para novas questões

Basta adicionar um arquivo dentro do diretório `/backend`, com o nome no formato `questao_{numeroDaQuestao}.pl`. Cada arquivo deve seguir o seguinte padrão:

## Estrutura do arquivo

### 1. Definição do módulo

O arquivo deve começar com a declaração do módulo. O nome do módulo deve ser igual ao nome do arquivo (sem a extensão `.pl`). Além disso, o módulo deve exportar dois predicados principais:

- `questao/3`
- `diagnostico/3`

Exemplo:

```prolog
:- module(questao_2465, [questao/3, diagnostico/3]).
```

### 2. Predicado `questao/3`

O predicado `questao/3` deve ser usado para mapear uma sequência de respostas a uma nova pergunta. Ele segue o formato:

```prolog
questao(NumeroDaQuestao, RespostasAteAgora, Pergunta).
```

- **`NumeroDaQuestao`**: Número da questão a que o arquivo se refere.
- **`RespostasAteAgora`**: Lista de respostas fornecidas pelo usuário até o momento.
- **`Pergunta`**: Pergunta a ser exibida com base nas respostas recebidas.

Exemplo:

```prolog
questao(2465, [], "Você quer uma dica de qual solução adotar pra esse problema?").
questao(2465, ["sim"], "Você pode usar um while True para verificar, a partir da posição (a, b) na matriz, qual vizinho...").
```

### 3. Predicado `diagnostico/3`

O predicado `diagnostico/3` deve ser usado para fornecer um diagnóstico final ou mensagem de feedback com base nas respostas completas do usuário. Ele segue o formato:

```prolog
diagnostico(NumeroDaQuestao, RespostasCompletas, Diagnostico).
```

- **`NumeroDaQuestao`**: Número da questão.
- **`RespostasCompletas`**: Lista de respostas fornecidas.
- **`Diagnostico`**: Diagnóstico ou feedback final.

Exemplo:

```prolog
diagnostico(2465, ["sim", "sim", "sim"], "Legal! Parabéns!").
diagnostico(2465, _, "Atente-se bem às dicas já enviadas ou pergunte novamente!").
```

## Considerações importantes

- Certifique-se de que todas as perguntas e diagnósticos estejam relacionados ao número da questão especificado.
- O sistema utilizará a lista de respostas fornecida até o momento para determinar qual pergunta exibir em seguida. Portanto, as sequências de respostas devem ser consistentes.
- Para mensagens genéricas ou casos em que as respostas não correspondam a nenhuma sequência específica, use `_` como curinga no campo `RespostasCompletas` no predicado `diagnostico/3`.

Com essa estrutura, o sistema poderá processar novas questões automaticamente, bastando que o arquivo correspondente seja adicionado ao diretório.
