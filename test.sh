#!/bin/bash
# Quick tests for the Bookshop, all sent through the gateway on port 5000.
# Usage: bash test.sh

GATEWAY=http://localhost:5000

echo "== Health =="
curl -s $GATEWAY/health
echo
echo "== Place an order: 2 copies of book 1 =="
curl -s -X POST $GATEWAY/api/orders \
  -H "Content-Type: application/json" \
  -d '{"book_id": 1, "quantity": 2}'
echo
echo "== All orders =="
curl -s $GATEWAY/api/orders
echo
echo "== Book 1 (stock should have gone down) =="
curl -s $GATEWAY/api/books/1
