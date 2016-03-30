# General notes on statistics (e.g. cheatsheet)
A place to put all the general notes on statistics I read about during my PhD.

## Common distributions

### Bernoulli
Result of a binary outcome (e.g. coin flip)

### Binomial
Sum of a set of Bernoulli trials

### Normal (Gaussian) 

The bell curve

- 68% lie with 1 SD of the mean
- 95% lie within 2 SD of the mean
- 2.5% in either tail
99% of the mass lies in 3 SD of the mean

Standard normal has mean 0 (and standard deviation of 1)

Quantiles 
 
- 1.28 = 90% 	(-1.28 = 10%)
- 1.645 = 95%	(-1.645 = 5%)
- 1.96 = 97.5%	(-1.96 = 2.5%)
- 2.33 = 99%	(-2.33 = 1%)

### Poisson
Used to model counts (ranges from 0 to infinity)  
Use for count data, event-time or survival data, contingency tables, approximating binomials where n is large and p is small  

Can be used to model rates  

Can be an approximate for binomial when n is large and p is low  

```
pbinom(2, size = 500, prob = 0.01) = 0.1234
ppois(2, lambda = 500 * 0.01) = 0.1247
```

## Asymptotics
Describes the behaviour of the statistics as the sample size limits to infinity (or another number like 0). Incredibly useful for simple inference.

### Law of Large Numbers
States that as you sample more and more, the sample mean converges to the population mean (or what you are estimating)

### Central Limit Theorem
One of the most important theorems in statistics! 
The CLT states that the distubtion of averages of independent and identically distributed variables becomes that of a standard normal as the sample size increases

$$Estimate - {Mean of Estimate} \over Standard Error$$
- this should be approximately normally distributed (though it doesn't guarantee the normal distrbution will be a good approximation - depends on the sample size! )

CLT doesn't also always approximate the **binomial** or **poisson** distribution well.

### Confidence Intervals
For a confidence interval of p, if we were to collect samples and reconstruct the intervals, p of them would contain the true mean being estimated. I.e. The sample mean is always in the confidence interval

### Standard Normal Deviates
The standard deviate = mean / standard deviation


