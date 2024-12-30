The solution involves explicitly breaking the retain cycle by setting the delegate to `nil` in the `dealloc` method of `MyViewController`.  Here's the corrected code:

```objectivec
@implementation MyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  myObject = [[MyObject alloc] init];
  myObject.delegate = self;
  [myObject doSomething];
}

- (void)myObjectDidFinish:(MyObject *)object {
  // ... handle completion ...
}

- (void)dealloc {
  myObject.delegate = nil; // Break the retain cycle
  // ... other deallocations
}

@end
```

By setting `myObject.delegate = nil`, the strong reference from `MyObject` to `MyViewController` is removed, allowing both objects to be deallocated properly.  Always consider breaking strong references in `dealloc` when using delegates or blocks to avoid retain cycles.