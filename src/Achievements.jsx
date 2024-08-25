import React, { useState } from 'react';
import { getAchievements } from './utils/eth';

function Achievements({ address }) {
  const [achievements, setAchievements] = useState([]);

  const fetchAchievements = async () => {
    const data = await getAchievements(address);
    setAchievements(data);
  };

  return (
    <div>
      <button onClick={fetchAchievements}>Fetch Achievements</button>
      <ul>
        {achievements.map((achievement) => (
          <li key={achievement.id.toString()}>
            <h3>{achievement.name}</h3>
            <p>{achievement.description}</p>
            <a href={achievement.metadataURI} target="_blank" rel="noopener noreferrer">
              Metadata
            </a>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Achievements;
