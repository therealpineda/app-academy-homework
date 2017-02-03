import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props)
    this.state = { num1: '', num2: '', result: '' }
  }

  setNum1(e) {
    this.setState({ num1: parseInt(e.target.value) });
  }

  setNum2(e) {
    this.setState({ num2: parseInt(e.target.value) });
  }

  add(e) {
    e.preventDefault();
    this.setState({result: (this.state.num1 + this.state.num2)});
  }

  subtract(e) {
    e.preventDefault();
    this.setState({result: (this.state.num1 - this.state.num2)});
  }

  mult(e) {
    e.preventDefault();
    this.setState({result: (this.state.num1 * this.state.num2)});
  }

  divide(e) {
    e.preventDefault();
    this.setState({result: (this.state.num1 / this.state.num2)});
  }

  clear(e) {
    e.preventDefault();
    this.setState({result: '', num1: '', num2: ''});
  }

  render() {
    const { num1, num2, result } = this.state
    return (
      <div>
        <h3>Calculator</h3>
        <p>Result: {result}</p>
        <p><input
          id="num1-input"
          size="4"
          onChange={this.setNum1.bind(this)}
          value={num1}>
          </input>
          <input
            id="num2-input"
            size="4"
            onChange={this.setNum2.bind(this)}
            value={num2}>
            </input>
          <button id="clear" onClick={this.clear.bind(this)}>CE</button>
          </p>
        <p>
        <button
          id="add"
          onClick={this.add.bind(this)}
          >+</button>
        <button
          id="subtract"
          onClick={this.subtract.bind(this)}
          >-</button>
        <button
          id="mult"
          onClick={this.mult.bind(this)}
          >*</button>
        <button
          id="divide"
          onClick={this.divide.bind(this)}
          >/</button>
      </p>
      </div>
    );
  }
}

export default Calculator;
