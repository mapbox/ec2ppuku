#!/usr/bin/env bash

CODE=0

PATH=$(dirname $0):$(dirname $0)/..:$PATH

out=$(ec2ppuku)
if [ -z "$out" ]; then
    echo "ok - default limit: 90%, noop"
else
    echo "not ok - default limit: 90%, noop"
fi

out=$(Ec2ppukuLimit=100 ec2ppuku)
if [ -z "$out" ]; then
    echo "ok - limit: 100%, noop"
else
    echo "not ok - limit: 100%, noop"
fi

out=$(Ec2ppukuLimit=0 ec2ppuku)
if echo $out | grep -q "Shutting down..."; then
    echo "ok - limit: 0%, halt"
else
    echo "not ok - limit: 0%, halt"
fi
if echo $out | grep -qE "/dev/[0-z]+ use [0-9]+% is above ec2ppuku limit 0%"; then
    echo "ok - limit: 0%, logs troublesome device"
else
    echo "not ok - limit: 0%, logs troublesome device"
fi
if echo $out | grep -q "mocked halt"; then
    echo "ok - limit: 0%, calls mocked halt"
else
    echo "not ok - limit: 0%, calls mocked halt"
fi

exit $CODE
