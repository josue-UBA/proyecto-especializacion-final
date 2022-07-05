import Container from 'react-bootstrap/Container';
import Navbar from 'react-bootstrap/Navbar'

function MiNav() {
    return <Container className="p-3 m-3">

        <Navbar bg="dark" variant="dark">
            <Container>
                <Navbar.Brand href="#home">
                    <img
                        alt=""
                        src="/uba.png"
                        width="70"
                        height="40"
                        className="d-inline-block align-top"
                    />{' '}
                    Plataforma para Aceleradores de Inteligencia Artificial
                </Navbar.Brand>
            </Container>
        </Navbar>

    </Container>
}


export default MiNav;