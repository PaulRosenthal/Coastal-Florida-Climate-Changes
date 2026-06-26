import './App.css';
import CurrentPanamaCityBeachFlagStatus from './panama_city_beach_flag_status';
import CurrentSouthWaltonFlagStatus from './south_walton_flag_status';

function App() {

  return (
    <div className="App">
      <header className="App-header">
        <h1>Emerald Coast Beach Flags Status Viewer</h1>
        <div
          style={{
            maxWidth: "700px",
            margin: "20px auto",
            padding: "16px",
            borderRadius: "10px",
            backgroundColor: "#f5f5f5",
            color: "#222",
            textAlign: "center"
          }}
        >
          <h3 style={{ marginTop: 0 }}>Support this project!</h3>
        
          <p>
            If you find this website helpful, please consider downloading my iPhone
            app, <strong>NW Florida Beach Flags</strong>, available on the App Store.
            In addition to Emerald Coast beach flags, the app also includes
            <strong> Destin beach flags</strong> and other features to help you plan
            your beach day.
          </p>
        
          <a
            href="https://apps.apple.com/us/app/emerald-coast-beach-flags/id6782753571"
            target="_blank"
            rel="noopener noreferrer"
            style={{
              display: "inline-block",
              marginTop: "10px",
              padding: "12px 20px",
              backgroundColor: "#1e293b",
              color: "white",
              border: "1px solid #4b5563",
              borderRadius: "8px",
              textDecoration: "none",
              fontWeight: "bold"
            }}
          >
            📱 Download NW Florida Beach Flags on the App Store
          </a>
        </div>

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
