async function main () {

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

  console.log("sounds: ", sounds1Contract.address);
  console.log("sounds: ", sounds1Contract.address);
  console.log("sounds: ", sounds1Contract.address);
  console.log("font: ", fontContract.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
 });
