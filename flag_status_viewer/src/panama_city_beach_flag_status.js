import React, { useState, useEffect } from 'react';

async function FetchPanamaCityBeachFlagStatus() {
    try {
      const response = await fetch('https://raw.githubusercontent.com/PaulRosenthal/Panama-City-Beach-Flags-Alexa-Skill/main/current-flag-status.txt');
      const data = await response.text();
      return data;
    } catch (error) {
      console.error(error);
      // Handle errors here (e.g., set a state variable for error message)
    }
  }

  const colorImageMap = {
    double: "https://seaflchange.org/img/flag_status_images/double_red_flags.png", 
    red: "https://seaflchange.org/img/flag_status_images/red_flag.png", 
    yellow: "https://seaflchange.org/img/flag_status_images/yellow_flag.png", 
    green: "https://seaflchange.org/img/flag_status_images/green_flag.png",
    purple: "https://seaflchange.org/img/flag_status_images/purple_flag.png"
  };
  
  function getImageByColor(color) {
    // Convert color to lowercase for case-insensitive matching
    const lowercaseColor = color.toLowerCase();
  
    // Extract potential color keywords using regular expression
    const colorMatch = lowercaseColor.match(/\b(double|red|yellow|purple|green)\b/);
  
    // Check if a color keyword was found
    if (colorMatch) {
      const matchedColor = colorMatch[1]; // Get the first captured color word
      return colorImageMap[matchedColor] ? colorImageMap[matchedColor] : null;
    } else {
      // No color keyword found, return null
      return null;
    }
  }
  
  function CurrentPanamaCityBeachFlagStatus() {
    const [color, setColor] = useState('Fetching flag status...'); // Initial color
    const [flag_image, setFlagImage] = useState("https://seaflchange.org/img/loading.gif"); // Initial flag image during loading period
    const [isLoading, setIsLoading] = useState(true); // Initial loading state
  
    useEffect(() => {
      FetchPanamaCityBeachFlagStatus()
        .then(data => {
          setColor(data);
          setFlagImage(getImageByColor(data));
          setIsLoading(false); // Set loading state to false after fetching data
        });
    }, []);
  
    return (
      <div>
        <h2>Panama City Beach, Florida</h2>
        {isLoading ? (
          <img src="https://seaflchange.org/img/loading.gif" alt="Loading Flag" />
        ) : (
          <img src={flag_image} alt="Flag" />
        )}
        <p>{color}</p>
      </div>
    );
  }
  
  export default CurrentPanamaCityBeachFlagStatus;