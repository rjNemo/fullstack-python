# How to write an asynchronous decorator in Python

A common pattern I use to write DRY (Don't Repeat Yourself) code in python is decorator. It is very useful to perform
clean up such as error handling outside a function.

However, if the function is `async` it might not work. There is a simple way to fix your decorators to handle both
`sync` and `async` functions.

Here is a fully working example:

```python
import functools
from inspect import isawaitable


def decorator(func):
    @functools.wraps(func)
    async def resolver(*args, **kwargs):
        try:
            result = func(*args, **kwargs)
            return await result if isawaitable(result) else result
        except Exception as error:
            return {"error": str(error)}

    return resolver
```

Voilà!