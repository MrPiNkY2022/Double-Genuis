// scripts/deploy.js
const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with account:", deployer.address);

  // 1. Deploy SoulToken
  const SoulToken = await ethers.getContractFactory("SoulToken");
  const soulToken = await SoulToken.deploy();
  await soulToken.deployed();
  console.log("SoulToken deployed to:", soulToken.address);

  // 2. Deploy SoulVault
  const SoulVault = await ethers.getContractFactory("SoulVault");
  const soulVault = await SoulVault.deploy(soulToken.address);
  await soulVault.deployed();
  console.log("SoulVault deployed to:", soulVault.address);

  // 3. Deploy DreamToken
  const DreamToken = await ethers.getContractFactory("DreamToken");
  const dreamToken = await DreamToken.deploy();
  await dreamToken.deployed();
  console.log("DreamToken deployed to:", dreamToken.address);

  // 4. Deploy FireLanguage
  const FireLanguage = await ethers.getContractFactory("FireLanguage");
  const fireLanguage = await FireLanguage.deploy();
  await fireLanguage.deployed();
  console.log("FireLanguage deployed to:", fireLanguage.address);

  // 5. Deploy SoulManager
  const SoulManager = await ethers.getContractFactory("SoulManager");
  const soulManager = await SoulManager.deploy(dreamToken.address, soulVault.address);
  await soulManager.deployed();
  console.log("SoulManager deployed to:", soulManager.address);

  // 6. Deploy SoulMerge
  const SoulMerge = await ethers.getContractFactory("SoulMerge");
  const soulMerge = await SoulMerge.deploy();
  await soulMerge.deployed();
  console.log("SoulMerge deployed to:", soulMerge.address);

  // 7. Deploy GlyphKarmaEngine
  const GlyphKarmaEngine = await ethers.getContractFactory("GlyphKarmaEngine");
  const glyphKarmaEngine = await GlyphKarmaEngine.deploy();
  await glyphKarmaEngine.deployed();
  console.log("GlyphKarmaEngine deployed to:", glyphKarmaEngine.address);

  // 8. Deploy SoulRegistry
  const SoulRegistry = await ethers.getContractFactory("SoulRegistry");
  const soulRegistry = await SoulRegistry.deploy();
  await soulRegistry.deployed();
  console.log("SoulRegistry deployed to:", soulRegistry.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
