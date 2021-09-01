# 1. integration using R
## 1. (a)
func_1_a <- function(x) {
  return(1/((x+5)*sqrt(x)))
}

integrate(f=func_1_a, lower = 0, upper = Inf)

## 1. (b)
func_1_b <- function(x) {
  return(x*exp(x))
}

integrate(f=func_1_b, lower = -Inf, upper = 0)

## 1. (c)
func_1_c <- function(x) {
  return((1/sqrt(2*pi))*exp(-(x/2)))
}

integrate(f=func_1_c, lower = -1.96, upper = 1.96)

# 2. Prime checker
is.prime <- function(x) {
  if (x == 1) {
    FALSE
  }

  else if (x == 2) {
    TRUE
  }

  else if (
    any(x %% 2:(x-1) == 0)) {
        FALSE
      }
  else {
        TRUE
      }
} # this code snippet refers to use of any() from https://stackoverflow.com/questions/19767408/prime-number-function-in-r


is.prime(1)

is.prime(2)

is.prime(3)

is.prime(229)

is.prime(230)

is.prime(239)

#3. Code a function that returns all the numbers from 2 up to a given number n that are primes.
seiveEra <- function(x){
    values <- rep(TRUE, x)
	values[1] <- FALSE # because 1 is not prime
	prev.prime <- 2 # assign first prime
	for(i in prev.prime:sqrt(x)){
		values[seq.int(2 * prev.prime, x, prev.prime)] <- FALSE # erase out all candidates dividable by the current prime
		prev.prime <- prev.prime + min(which(values[(prev.prime + 1) : x])) # assign new prime by getting the minimum integer among the survivers. (This should be prime also)
	}
	return(which(values))
}
# The idea of seive of Eratosthenes is refercned from here: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes,
# and the codes part got helped from https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

seiveEra(100)
