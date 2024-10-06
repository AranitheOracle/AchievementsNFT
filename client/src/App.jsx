import React from 'react';
import ConnectButton from './ConnectButton';
import CreateAchievement from './CreateAchievement';
import Achievements from './Achievements';

function App() {
  const userAddress = 'USER_ADDRESS'; // Replace with actual address or dynamically fetch it

  return (
    <div>
      <h1>Achievement NFT DApp</h1>
      <ConnectButton />
      <CreateAchievement />
      <Achievements address={userAddress} />
    </div>
  );
}

export default App;
