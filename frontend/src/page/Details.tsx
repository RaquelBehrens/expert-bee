import "react-chatbot-kit/build/main.css";
import { styled } from "styled-components";
import Accordion from '@mui/material/Accordion';
import AccordionActions from '@mui/material/AccordionActions';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';

const StyledChat = styled.div`
  display: flex;
  align-items: start;
  width: 100%;
  height: 100vh;

  .accordion-container {
    margin: 1rem;
  }
`;

const Details = () => {
  return (
    <StyledChat>
      <div className="accordion-container">
        <Accordion>
            <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel1-content"
            id="panel1-header"
            >
            Resposta errada/Wrong answer
            </AccordionSummary>
            <AccordionDetails>
            Se o URI dizer "resposta errada/wrong answer" você deve criar novos casos de teste 
            para tentar adivinhar onde teu programa está falhando. Note que no enunciado são 
            dados apenas poucos casos de teste, mas o URI usa muitos outros casos de teste para 
            saber se teu programa funciona ou não. Teu programa pode funcionar para os exemplos do 
            enunciado, mas pode falhar para outras situações. Utilize o "uDebug" que está no menu 
            do URI na página do enunciado do problema para encontrar exemplos de outros casos de 
            teste. Teste tua solução com todos esses novos casos de teste e verifique se as respostas 
            dadas pelo teu programa estão corretas ou não. Caso teu programa não está dando resposta 
            correta, estude esses casos de teste e volte para o passo 4 para tentar simular no papel 
            a tua estratégia de solução para o problema. Caso você conseguir chegar no resultado usando 
            o papel, então você saberá que escreveu algo errado no programa Python, portanto você 
            deve rever o programa em Python para ajustá-lo. Você também pode utilizar o Thonny para 
            debugar (executar o programa passo-a-passo) e assim tentar identificar onde está o erro 
            para o caso de teste que não está funcionando.
            </AccordionDetails>
        </Accordion>
        <Accordion>
            <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel2-content"
            id="panel2-header"
            >
            Tempo limite excedido/Time limit exceeded
            </AccordionSummary>
            <AccordionDetails>
            Significa que teu programa não está parando ou é muito lento. Confira se você tem 
            estruturas de repetição e se elas tem alguma condição de parada. Ex: se você tiver um 
            while (i &lt; 100), confira se este i chegará mesmo em 100, incrementando, por exemplo, de 
            um em um. Se a entrada do problema dizer que termina com EOF, confira nos slides da 
            disciplina como terminar a entrada de dados por EOF, no tema de "Estruturas de Repetição".
            </AccordionDetails>
        </Accordion>
        <Accordion>
            <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel3-content"
            id="panel3-header"
            >
            Erro de compilação/Compile error
            </AccordionSummary>
            <AccordionDetails>
            Confira a linguagem que você está submetendo no URI. Sempre escolha qualquer versão do 
            Python 3.x (tanto faz se x for 4, 5, 6, 7 8). Além disso, confira se em algum momento do 
            código fonte você está usando "import". Se sim, tente resolver seu problema sem "import".
            </AccordionDetails>
            <AccordionActions>
            </AccordionActions>
        </Accordion>
        <Accordion>
            <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel3-content"
            id="panel3-header"
            >
            Erro em tempo de execução/Run-time error
            </AccordionSummary>
            <AccordionDetails>
            Significa que seu programa está gerando um erro quando está sendo executado pelo URI. 
            Confira se você tem algum tipo de divisão no programa, seja por / ou % ou //. Se tiver, 
            veja se pode ocorrer do denominador ser zero (note que não existe divisão por 0 e seu 
            programa pode gerar erro por isso). Se não tiver divisão, veja se você está trabalhando 
            com algum tipo de estrutura (vetor, matriz, lista), e então confira se você pode estar 
            acessando uma posição inválida desta estrutura. Por exemplo, se o vetor tem 10 posições 
            e você está tentando acessar a posição 15, obviamente irá gerar um erro. Outro causador 
            desse erro é na leitura dos dados de entrada. Por exemplo, se os dados de entrada são 
            fornecidos numa mesma linha separados por espaços, deve-se atentar para a forma correta 
            de fazer a leitura desses dados.
            </AccordionDetails>
            <AccordionActions>
            </AccordionActions>
        </Accordion>
        <Accordion>
            <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls="panel3-content"
            id="panel3-header"
            >
            Erro de apresentação/Presentation error
            </AccordionSummary>
            <AccordionDetails>
            Esse erro ocorre normalmente por falta de quebras de linhas ou espaços, ou excesso de 
            quebras de linhas ou espaços. Assim, por exemplo, se o enunciado pede para imprimir uma 
            linha em branco entre os casos de testes, você deve imprimir uma linha em branco entre 
            os casos de testes. Um caso comum em que esse erro também ocorre é ao imprimir uma lista 
            de valores numa mesma linha, e então há um espaço sobrando após o último valor impresso 
            (você deve cuidar para que ele não seja impresso).
            </AccordionDetails>
            <AccordionActions>
            </AccordionActions>
        </Accordion>
      </div>
    </StyledChat>
  );
};

export default Details;
