# How to fix typing-related circular imports

Circular imports in Python are one of the worst…

Hopefully you can use conditional import so that only static analysis tools (mypy, pyre, _etc_) import these types for
linting and not at runtime.

It solves a lot of circular imports. In combination with `__future__` annotations, you don't need to enclose such
classes in quotes.

```python
from __future__ import annotations

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from ..types import BillingAddress, Customer


def set_customer_billing_address(billing_address: BillingAddress) -> Customer:
    return Customer(
        name=billing_address.name,
        street=billing_address.street,
        house_number=billing_address.house_number,
        postal_code=billing_address.postal_code,
        city=billing_address.city,
        country_id=billing_address.country_id,
        vat_id=billing_address.vat_id,
    )
```

An additional point to note is the use of  `__init__` files. Think carefully before importing from submodules because
all links references in it will be imported. This results in circular imports that can be hard to debug.

Voilà!