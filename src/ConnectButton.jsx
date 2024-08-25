import React, { useState } from 'react';
import { connect } from './utils/eth';

function ConnectButton() {
  const [connected, setConnected] = useState(false);

  const handleConnect = async () => {
    await connect();
    setConnected(true);
  };

  return (
    <button onClick={handleConnect}>
      {connected ? 'Connected' : 'Connect Wallet'}
    </button>
  );
}

export default ConnectButton;
