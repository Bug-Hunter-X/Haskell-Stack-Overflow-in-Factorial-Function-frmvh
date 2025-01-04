The solution is to explicitly check for negative input and return an appropriate result (e.g., an error value or throw an exception) in that case. Here's a corrected version:

```haskell
factorial :: Int -> Maybe Integer
factorial 0 = Just 1
factorial n | n > 0    = Just (n * fromIntegral (factorial' (n - 1))) -- Safe conversion to avoid Integer overflow
           | otherwise = Nothing -- Handle negative input

factorial' :: Int -> Integer
factorial' 0 = 1
factorial' n = n * factorial' (n - 1) 
```

This revised version uses `Maybe Integer` as the return type to explicitly indicate the possibility of an error (represented by `Nothing`).  It checks for positive input (`n > 0`) before making the recursive call. Now, the function will gracefully handle negative inputs, preventing the stack overflow error.