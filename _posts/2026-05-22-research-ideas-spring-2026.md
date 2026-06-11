---
layout: post
title: "Research Ideas - Spring 2026"
description: "A laundry list of some research ideas, circa Spring 2026"
date: 2026-05-22
tag: technical
math: true
hidden: false
---

<!-- Start writing here. Use # headings for sections. -->


I'll expand on these at some point. 


Research ideas: 


1. Self-distillation reward models 
    1. Self distillation without imitation (SDRM, main idea) 
        1. SDRM-MSE-log-ratio between student/teacher tokens/trajectories 
        2. SDRM-BT: treat teacher tokens/trajectories as preferences —> induce DPO 
    2. Reward model scaling laws (sub idea) 
    3. Inference-time verification via self-distillation (extension of SDRM) 
    4. Using the reward model as a “guide”/”sampler” 
         <!-- See pedagogical RL and Luke Bailey's self-play paper -->
         <!-- Also wonder if we can use the guide/teacher to inject OOD data to enable continual learning -->
    5. Self-distillation world model (representation learning)
    - Some alternative names:
        - SDRM: Self-Distillation Reward Models (current)
        - SCPO: Self-Critic Policy Optimization
        - STPO: Student-Teacher Policy Optimization
2. Learning from environment feedback (self-distillation and friends) 
3. Teacher guided self distillation for self-play (similar to idea 1.4)
4. AlphaZero style exploration in language model post-training
    1. Right now, LM’s just sample during policy gradient, and so if we want to solve a problem, the solution must exist in distribution. However, if you think about it, all a solution really is is just a correct sequence/combination of tokens in a trajectory. Of course, this is combiniatoricalay intractable but what if we can apply some alpha-go/alpha-zero learning here? The “rules of the game” is understanding language. Without giving that understanding, we have alphago. With it, we have alpha-zero. 