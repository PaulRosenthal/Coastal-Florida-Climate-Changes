import logo from './logo.png';
import './App.css';
import CurrentPanamaCityBeachFlagStatus from './panama_city_beach_flag_status';
import CurrentSouthWaltonFlagStatus from './south_walton_flag_status';

function App() {

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <CurrentPanamaCityBeachFlagStatus />
        <br></br>
        <CurrentSouthWaltonFlagStatus />
        <a
          className="App-link"
          href="https://seaflchange.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Sea Florida Change
        </a>
      </header>
    </div>
  );
}

export default App;
