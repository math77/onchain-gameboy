async function main () {
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
  console.log("--------------------------------------------------------");

  console.log("Sounds1: ", sounds1Contract.address);
  console.log("Sounds2: ", sounds2Contract.address);
  console.log("Sounds3: ", sounds3Contract.address);
  console.log("Font: ", fontContract.address);
  
  /*
  await hre.run("verify:verify", {
    address: cryptoMazeContract.address,
    constructorArguments: [
      metaContract.address,
    ],
  });
  */
  
}


main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
