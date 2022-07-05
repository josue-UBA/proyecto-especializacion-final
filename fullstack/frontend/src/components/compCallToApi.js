import React from 'react'
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button'
import Container from 'react-bootstrap/Container'


class CompCallToApi extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      temp: '',
      idSelected: '',
      allId: []
    };
  };

  prueba(event) {
    event.preventDefault();

    async function postapi() {

      try {
        let mi_json = {
          info: "enviado desde el frontend",
          entrada: {
            dato_1: event.target[0].checked,
            dato_2: event.target[1].checked,
            dato_3: event.target[2].checked,
            dato_4: event.target[3].checked
          },
          red: {
            dato_1: event.target[4].checked,
            dato_2: event.target[5].checked,
            dato_3: event.target[6].checked
          },
          general: {
            dato_1: event.target[7].value,
            dato_2: event.target[8].value
          }
        }

        let postRequest = {
          method: 'post',
          body: JSON.stringify(mi_json)
        }
        let respo = await fetch("http://localhost:8000/app", postRequest);
        let data_json = await respo.json();
        console.log(data_json) // borrar esta linea despues
        alert("Se enviaron los datos al servidor!");

      } catch (error) {
        console.log(error);
        alert("Revisa el servidor. Parece que esta caido.");
      }

    }
    postapi();
  }

  render() {
    return (
      <Container className="p-3 m-3">
        <Form onSubmit={this.prueba}>
          <Row>
            <Col>
              <h3>Configuracion de Entrada</h3>
              <Row>
                <Col><Form.Label>AXI 4 lite</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_1"></Form.Check></Col>
              </Row>
              <Row>
                <Col><Form.Label>DMA</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_1"></Form.Check></Col>
              </Row>
              <Row>
                <Col><Form.Label>GPIO botones</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_1"></Form.Check></Col>
              </Row>
              <Row>
                <Col><Form.Label>GPIO push</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_1"></Form.Check></Col>
              </Row>
            </Col>
            <Col>
              <h3>Tipo de Red</h3>
              <Row>
                <Col><Form.Label>Red neuronal A</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_2"></Form.Check></Col>
              </Row>
              <Row>
                <Col><Form.Label>Red neuronal B</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_2"></Form.Check></Col>
              </Row>
              <Row>
                <Col><Form.Label>Red neuronal C</Form.Label></Col>
                <Col><Form.Check type="radio" name="grupo_boton_2"></Form.Check></Col>
              </Row>

            </Col>
          </Row>
          <Row>
            <Col>
              <h3>Configuracion General</h3>
              <Row>
                <Col><Form.Label>Nombre de proyecto</Form.Label></Col>
                <Col>
                  <Form.Label htmlFor="inlineFormInput" visuallyHidden>
                    Name
                  </Form.Label>
                  <Form.Control className="mb-2" id="inlineFormInput" placeholder="Completar" />
                </Col>
              </Row>
              <Row>
                <Col><Form.Label>Ubicacion del archivo C</Form.Label></Col>
                <Col>
                  <Form.Label htmlFor="inlineFormInput" visuallyHidden>
                    Name
                  </Form.Label>
                  <Form.Control className="mb-2" id="inlineFormInput" placeholder="Completar" />
                </Col>
              </Row>
            </Col>
            <Col>
              <h3>Enviar</h3>
              <Button type="submit" className="mb-2">
                Submit
              </Button>
            </Col>

          </Row>
        </Form>
      </Container>
    );
  }
}

export default CompCallToApi;
