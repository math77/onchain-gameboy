const main = async () => {
  //DEPLOY SOUNDS CONTRACTS
  const sounds1Factory = await hre.ethers.getContractFactory('CryptoMazeSounds1');
  const sounds1Contract = await sounds1Factory.deploy();
  
  await sounds1Contract.deployed();

  const sounds2Factory = await hre.ethers.getContractFactory('CryptoMazeSounds2');
  const sounds2Contract = await sounds2Factory.deploy();
  
  await sounds2Contract.deployed();

  const sounds3Factory = await hre.ethers.getContractFactory('CryptoMazeSounds3');
  const sounds3Contract = await sounds3Factory.deploy();
  
  await sounds3Contract.deployed();

  //DEPLOY FONT CONTRACT
  const fontFactory = await hre.ethers.getContractFactory('CryptoMazeFont');
  const fontContract = await fontFactory.deploy();
  
  await fontContract.deployed();

  // DEPLOY METADATA CONTRACT  
  const metaContractFactory = await hre.ethers.getContractFactory('CryptoMazeMetadata');
  const metaContract = await metaContractFactory.deploy(sounds1Contract.address, sounds2Contract.address, sounds3Contract.address, fontContract.address);
  
  await metaContract.deployed();
  console.log("Contract metadata deployed to:", metaContract.address);

  // DEPLOY MAIN CONTRACT
  const cryptoMazeFactory = await hre.ethers.getContractFactory('CryptoMaze');
  const cryptoMazeContract = await cryptoMazeFactory.deploy(metaContract.address);
  
  await cryptoMazeContract.deployed();
  console.log("Main contract deployed to:", cryptoMazeContract.address);
  
  let txn;
  txn = await cryptoMazeContract.letTheGameBegin({ value: ethers.utils.parseEther("0.005") });
  let tokenId = await txn.wait();

  let txn2;
  txn2 = await cryptoMazeContract.letTheGameBegin({ value: ethers.utils.parseEther("0.005") });
  let tokenId2 = await txn2.wait();

  let txn3;
  txn3 = await cryptoMazeContract.letTheGameBegin({ value: ethers.utils.parseEther("0.005") });
  let tokenId3 = await txn3.wait();

  //let returnedTokenUri = await cryptoMazeContract.tokenURI(1);
  //console.log("Token URI 1:", returnedTokenUri);
  console.log("Txn: ", txn);
  console.log("Token ID: ", tokenId);

  console.log("Txn2: ", txn2);
  console.log("Token ID2: ", tokenId2);

  console.log("Txn2: ", txn3);
  console.log("Token ID2: ", tokenId3);

};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();