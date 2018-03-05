pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/lifecycle/Pausable.sol';
import '../tokens/AkropolisToken.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';

/**
 * @title AETFaucet
 * @dev This contract airdrops tokens to user account
 * Beware: It's only for the demo purpose, shouldn't be used in production mode.
 */
contract AETFaucet is Pausable {
    using SafeMath for uint256;

    AkropolisToken public aet;

    function AETFaucet(AkropolisToken _aet) {
        aet = _aet;
    }

    function getTokens(address _beneficiary) whenNotPaused public payable {
        uint256 amount = msg.value.mul(1000);
        aet.transfer(_beneficiary, amount);
    }
}
