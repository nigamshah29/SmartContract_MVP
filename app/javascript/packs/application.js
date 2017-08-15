/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


console.log('Hello World from Webpacker')
debugger;
App = {
  web3Provider: null,
  contracts: {},

  // init: function() {
  //   // Load pets.
  //   $.getJSON('../pets.json', function(data) {
  //     var petsRow = $('#petsRow');
  //     var petTemplate = $('#petTemplate');

  //     for (i = 0; i < data.length; i ++) {
  //       petTemplate.find('.panel-title').text(data[i].name);
  //       petTemplate.find('img').attr('src', data[i].picture);
  //       petTemplate.find('.pet-breed').text(data[i].breed);
  //       petTemplate.find('.pet-age').text(data[i].age);
  //       petTemplate.find('.pet-location').text(data[i].location);
  //       petTemplate.find('.btn-adopt').attr('data-id', data[i].id);

  //       petsRow.append(petTemplate.html());
  //     }
  //   });

  //   return App.initWeb3();
  // },
  init: function() {
    debugger;
  },

  initWeb3: function() {
    // Initialize web3 and set the provider to the testRPC.
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // set the provider you want from Web3.providers
      App.web3Provider = new web3.providers.HttpProvider('http://localhost:8545');
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },

  initContract: function() {
    $.getJSON('Coder.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with truffle-contract.
      var CoderArtifact = data;
      App.contracts.Coder = TruffleContract(CoderArtifact);

      // Set the provider for our contract.
      App.contracts.Coder.setProvider(App.web3Provider);

      // Use our contract to retrieve and mark the adopted pets.
      // return App.markAdopted();
    });
    return App.bindEvents();
  },

  bindEvents: function() {
    debugger;
    $(document).on('click', '.btn-start', this.handleStartRequirement/*(reqId, contract_amount)*/);
    $(document).on('click', '.btn-request', App.handleRequestApproval);    
    $(document).on('click', '.btn-approve', App.handleApproval);
  },

  handleStartRequirement: function(reqId, contract_amount) {
    // inside here, this is the dom element
    debugger;
    event.preventDefault();
    const id = this.dataset.id;
    const payment = this.dataset.payment;

    var reqId = parseInt($(event.target).data('id'));

    var coderInstance;

    web3.eth.getAccounts(function(error, accounts){
      if (error) {
        console.log(error);
      }

      var coderAdmin = accounts[0];

      App.contracts.Coder.deployed().then(function(instance) {
        coderInstance = instance;

        return coderInstance.startRequirement();
      }).then(function(result) {
        return App.markAdopted();
      }).catch(function(err) {
        console.log(err.message);
      });
    });
  },

  // markAdopted: function(adopters, account) {
  //   var adoptionInstance;

  //   App.contracts.Adoption.deployed().then(function(instance) {
  //     adoptionInstance = instance;

  //     return adoptionInstance.getAdopters.call();
  //   }).then(function(adopters) {
  //     for (i = 0; i < adopters.length; i++) {
  //       if (adopters[i] !== '0x0000000000000000000000000000000000000000') {
  //         $('.panel-pet').eq(i).find('button').text('Pending...').attr('disabled', true);
  //       }
  //     }
  //   }).catch(function(err) {
  //     console.log(err.message);
  //   });  
  // }

};

$(function() {
  App.init();
  $(window).load(function() {});
});

const Eth = require('ethjs-query')
const EthContract = require('ethjs-contract')
const address = '0xb351027c5d80ff2509c68528685578ab17bd9517'

function startApp(web3) {
  const eth = new Eth(web3.currentProvider)
  const contract = new EthContract(eth)
  initContract(contract)
}

function initContract (contract) {
  const MiniToken = contract(abi)
  const miniToken = MiniToken.at(address)
  listenForClicks(miniToken)
}

function listenForClicks (miniToken) {
  var button = document.querySelector('button.btn-approve')
  button.addEventListener('click', function() {
    var inWei = web3.toWei('10', 'ether')
    miniTokentoken.transfer(toAddress, value, { from: addr })
    .then(function (txHash) {
      console.log('Transaction sent')
      console.dir(txHash)
      waitForTxToBeMined(txHash)
    })
    .catch(console.error)
  })
}

async function waitForTxToBeMined (txHash) {
  let txReceipt
  while (!txReceipt) {
    try {
      txReceipt = await eth.getTransactionReceipt(txHash)
    } catch (err) {
      return indicateFailure(err)
    }
  }
  indicateSuccess()
}
