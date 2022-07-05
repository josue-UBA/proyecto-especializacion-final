import logo from './logo.svg';
import './App.css';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Button from 'react-bootstrap/Button';
import React from 'react';

import MiNav from './components/miNav';
import CompCallToApi from './components/compCallToApi'

function App() {
  return (
    <div className="App">
      <AutoLayoutExample />
    </div>
  );
}

export default App;

function AutoLayoutExample() {
  return (
    <Container>
      <Row>
        <MiNav />
      </Row>
      <Row>
        <Col><CompCallToApi /></Col>
      </Row>
    </Container>
  );
}

function HorizontalExample() {
  function hola() {
    console.log("dentro de hola!!");
  }
  return (
    <Container>
      <h2>Configuración de interfaces de entrada</h2>
      <Form onSubmit={hola()}>
        <fieldset>
          <Form.Group as={Row} className="mb-3">
            <Form.Label as="legend" column sm={5}>
              Seleccionar red
            </Form.Label>
            <Col sm={5}>
              <Form.Check
                type="radio"
                label="red 1"
                name="formHorizontalRadios"
                id="formHorizontalRadios1"
              />
              <Form.Check
                type="radio"
                label="red 2"
                name="formHorizontalRadios"
                id="formHorizontalRadios2"
              />
            </Col>
          </Form.Group>
        </fieldset>
        <Form.Group as={Row} className="mb-3">
          <Col sm={{ span: 10, offset: 2 }}>
            <Button type="submit">Sign in</Button>
          </Col>
        </Form.Group>
      </Form>
    </Container>
  );
}

