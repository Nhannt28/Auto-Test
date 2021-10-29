class Calculator(object):
    strMath = '1234567890+-*/C='

    def __init__(self):
        self._expression = ''

    def Calculate(self, strMath):
        if str not in self.strMath:
            raise CalculationError("Invalid button '%s'." % str)
        if str == '=':
            self._expression = self._calculate(self._expression)
        elif str == 'C':
            self._expression = ''
        elif str == '/':
            self._expression += '//'    # Integer division also in Python 3
        else:
            self._expression += str
        return self._expression

    def _calculate(self, expression):
        try:
            return str(eval(expression))
        except SyntaxError:
            raise CalculationError('Invalid expression.')
        except ZeroDivisionError:
            raise CalculationError('Division by zero.')


class CalculationError(Exception):
    pass