---
layout: post
title: The Evolving AI Startup Market Landscape - Spring 2026
description: Raw notes on the evolving AI startup landscape, c. Spring 2026 
date: 2026-05-17
tag: ai
math: true
hidden: false
---

These are some rough notes on the evolving AI startup landscape. It is meant to serve as a means of distillation from the thoughts in my mind to the web.

It is not meant to be an argumentative piece. It is more of a descriptive note. It has turned into a bit of an AI startup index of sorts. 

I will update it over time. It is not complete yet and I'll add to it whenever I get new information or thoughts. 
 

## The archetypes  

- **Frontier labs**: needs little description. Develop foundation models. 
- **Holding firms**: AI-enabled roll-ups. AI x Private Equity. Instead of selling software to service businesses, acquire the businesses and use AI to increase margins, throughput, and customer experience. 
- **Neolabs**: differing approaches to foundation model development. New AI labs pursuing different approaches to frontier model development. Often founded by ex-frontier-lab researchers.
- **Horizontal/AI infra** building out infra for inference, post-training, data, evaluation, agent monitoring, RL environments, and deployment. The roads the cars drive on. 
- **Vertical AI**: building applications or agents on top of foundation models for specific domains and verticals. The cars that drive on the road. 
- **Robotics**: applying foundation-model-style scaling to embodied intelligence, manipulation, humanoids, industrial robots, and general-purpose robot brains. 
- **Other**: Misc.  

---

## Holding Firms 

This is one of the more interesting new categories. The basic insight is that AI may not be easiest to monetize by selling SaaS into legacy services businesses. Instead, you can buy the services business itself, install AI-native operating systems, and capture the margin expansion directly. One of the core theses surrounding this technological revolution as opposed to ones in the recent past is that AI can tap into not just the software/IT spend, but also services spend, since agentic workflows produce outcomes, not just a product. 

This particular approach is “AI x Private Equity,” but with more of an operating-company flavor than classic financial engineering. The bet is that many services businesses have messy workflows, repetitive back-office processes, customer service bottlenecks, and large pools of unstructured data[^1]. If AI can automate or augment those workflows, then the owner of the business captures the upside. As opposed to traditional private equity, the goal of a holding company is not to simply acquire, scale, and then sell a business, but to hold it for the long-term, rather than focusing on flipping it. There are a few new players in this space which I outline below. 

### Thrive Holdings

Thrive Capital’s holding-company vehicle focused on acquiring and operating service businesses where AI can drive operational improvement. OpenAI took an ownership stake in Thrive Holdings in 2025, with the partnership framed around embedding OpenAI research/product/engineering resources into traditional industries such as accounting and IT services. 

What is notable here is its connection to Thrive Capital itself and OpenAI. Thrive Capital is a large investor in OpenAI so the partnership is tighter than what other holding firms might have. 



### Ithaca Holdings

Reported new holding-company effort founded by former Sequoia partner Ravi Gupta and former Meta CRO John Hegeman, reportedly targeting over $1B in fundraising to acquire and upgrade companies. Public information is still relatively sparse, but it fits the broader “AI roll-up / AI-enabled holdco” pattern. Ravi Gupta's background is also fitting for this approach, having worked in consulting, private equity, startups, and venture capital, each at the highest level. 


### Long Lake Management Holdings 

Founded by former Oaktree MD along with Zach Frankl, and a few other technical people (including a recent Stanford alum!). 

The publicly available information is sparse, but the model appears similar: acquire services companies, then improve operations through AI and software. The jobs postings they have online gives us similar insight: they have people working on M&A to source and dilligence services businesses, and then a team of engineers and operators who work to grow the business. Focus on long-term holding. A recent podcast between Elad Gil and Alex Taubman provides a nice overview.


### Frontier labs x PE Firms 

While not a specific company, the joint venture that has recently begun between heavyweights in the PE industry and the frontier labs is notable. 

The premise is that these PE firms have tons of portfolio companies that need to be injected with AI to expand margins, but these companies don't have the technical talent to do so. So OpenAI and Anthropic are partnering with the likes of Blackstone to enable this transfer of knowledge and implementation. Both frontier labs are hiring aggressively for the so called "forward deployed engineer" which is half consultant and half engineer. 

It is a trade that makes logical sense: frontier labs have talent to deploy and the PE firms have businesses that need the AI talent, but can't afford it in house. 



## Horizontal AI / Infrastructure 


### Modal

Develops broad range of cloud infrastructure products. Most notable for serverless access to GPU's for model inference and training. I have personally been a big fan of their work and team, and use Modal sometimes for training models. Seems to be focusing a lot on the inference side of things too, given the asymmetric demand for it. 


### Together AI 

Has really good systems team, including lots of the worlds best kernel engineers and researchers. Many have come out of Stanford. Tri Dao and Dan Fu are two notable names. 


### Baseten 

### Fireworks AI 


### Turbopuffer 

Builds vector databases that are fast and efficient. Low-latency emphasis. Touts Cursor as a customer. 


### RadixArk

AI infrastructure company founded by creators and maintainers behind SGLang, including Ying, Stanford PhD and one of the key authors on the SGLang paper. The company is building open, scalable systems for training, deploying, and running frontier models, with inference, training, and post-training as first-class pieces of the same stack. RadixArk’s public launch emphasized SGLang for inference and Miles for reinforcement learning.


### Inferact  

Similar to RadixArk. Founded by creators and maintainers of vLLM. Its mission is to grow vLLM as a major open-source inference engine and make LLM inference faster and cheaper.

RadixArk vs. Inferact is like the product competition version of SGLang vs vLLM. 

### Post-training and continual learning 

#### Applied Compute 

#### Trajectory 


#### Engram Lab


### RL environments 

#### **Fleet AI**

#### Mechanize 

### Data labor marketplaces 

#### Surge AI 

#### Scale AI 

#### Mercor 


#### Turing 

#### Verita AI 

#### micro1 


### Agent infrastructure 

#### Judgement Labs 



## Vertical AI 

### Coding 

#### Cognition 

Developers of Devin: the AI software engineer. Focuses on end-to-end software engineering. Heavy deployment in enterprise. Less consumer-facing. Hiring deployed engineers and sales-related roles to deploy Devin in the enterprise. Touts the likes of Goldman Sachs as customers. Notably, one of the few coding companies that is still standing alone, outside of a frontier lab. 

Team is lean, dense, and extremely technical — think IMO/IOI medalists. Scott Wu and his disciples. 


#### Cursor 

Recently began a merge with Elon's xAI. My understanding of the deal is that Cursor needs compute and xAI needs talent and so this merger is a means for each organization to acquire what they need. Cursor's RL team is solid, housing some notable names including Sasha Rush and some recent Stanford PhD's (whose research I follow). Heavy consumer demand and focus. Seems to have more consumer demand than Cognition, though enterprise adoption compared to them is unclear. 


### Sales 

- **Decagon**: 
- **Sierra**: 


### Healthcare and medicine 

#### Phylo Bio 

Develops an AI agent for biology experiments. 

#### Abridge 


### Other 

#### Quadrillion 

Develops an AI agent and platform for research. Think Jupyter notebooks x AI agent. 



## Neolabs 

- **Flapping Airplanes**: Focusing on data and systems efficiency. Argues that models are not nimble enough for real-world, broad enterprise impact. Focuses on designing data-efficient models, as well as systems-level work, such as megakernels. Team is small and well-funded. Touts Ben Spector and his brother Asher as their leads. Ben has a deep background in ML systems, having developed megakernels at Stanford and also started Prod. 
- **humans&**: 
- **Thinking Machines Lab**: Unclear. Half RL post-training via Tinker product. Half human-AI interaction lab. 
- **Periodic Labs**:  
- **Thoughtful Lab**: 
- **Ineffable Intelligence**: 


### Nathan Lambert 

Recently left Ai2 so assuming he might be starting an open research lab? 

### Reflection 

Neolab focused on open source model development for America. 




### Mistral 


Focused on open source model development. Heavy European presence. 


## Robotics 


### Physical Intelligence 

### Skild AI 

### OpenAI robotics 

### Mecha 

Data and deployment layer for robotics 


## Other 

### SemiAnalysis (Capital)  

### Situational Awareness LP 



[^1]: As a side note, I'd be very curious to see if these firms try to sell the port co's data to the frontier labs as an alternative revenue stream