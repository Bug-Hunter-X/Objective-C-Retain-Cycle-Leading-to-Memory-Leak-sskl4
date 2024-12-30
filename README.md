# Objective-C Retain Cycle Bug

This repository demonstrates a common Objective-C memory management error involving retain cycles.  The example shows a `MyViewController` and a `MyObject` where a strong reference cycle is created.  The solution shows how to break the cycle and prevent memory leaks.

## Bug Description

A retain cycle occurs between `MyViewController` and `MyObject`. Because each object strongly retains the other, neither can be deallocated even when no longer needed. This leads to memory leaks and application instability.

## How to Reproduce

1. Clone the repository.
2. Run the project in Xcode.
3. Observe the memory usage.  The memory will not be released properly due to the retain cycle.

## Solution

The solution involves breaking the retain cycle by setting the delegate to `nil` in the `dealloc` method of `MyViewController` to remove the strong reference.