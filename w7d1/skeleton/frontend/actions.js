const selectCurrency = (baseCurrency, rates) => {
  const action = {
    type: 'SWITCH_CURRENCY',
    baseCurrency: baseCurrency,
    rates: rates
  }
  return action;
}

window.selectCurrency = selectCurrency;

export default selectCurrency;
