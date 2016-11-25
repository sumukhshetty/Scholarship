module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.autolink();
  deployer.deploy([Scholarship, 0x90f4547f30a3e78a7663a18ea8fefc8998ea5dc1,25,20,1,0xf6647f7a340a5c3bceb0fdd87218c2f99f4d9cf1]);
};
