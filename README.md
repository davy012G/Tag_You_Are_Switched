# Tag, You're Switched

This was supposed to be my entry to the 14th Github Game Off Jam. The endgoal is to get close enough to the king to shift roles. Created using the Nim Programming language and the Naylib library (a Nim binding for raylib).

> *A stealth game about revenge, mercy, and the throne that was stolen from you.*

Entry for **GitHub Game Off 2026** — Theme: **SHIFT**

---

## The Pitch

You are a slave. Once, your family ruled this kingdom for generations — until the current king stole the throne, framed you as the thief, and condemned you to a life of servitude for a crime he committed.

Now you're back. Not to kill him. To **switch roles**.

Get close to the king without being seen, press **S**, and become the king — while he becomes the slave. That's the whole game. But between you and him stands his guard, and every one of them knows exactly what's coming for them.

---

## The World

You are **the terror**.

Not because you're a monster - because you're the thing they made. The guards don't fear a beast; they fear a wronged man with a claim. They protect the king not out of loyalty, but out of self-preservation: if you take his role, you take control of *them*. And they know what atonement looks like.

The king is a grown man in his fifties - still strong, still quick enough to run and to swap. But he lost his son, who used to be his eyes, in a raid. Now he navigates by a stick and by sound. He cannot fight. His only power is to **swap positions with one of his guards** — a true swap, leaving a guard where he stood. And he only does it when he's hurt, because he cannot see you coming.

---

## Mechanics

| Input | Action |
| --- | --- |
| Arrow Keys | Move |
| Space | Shoot |
| S | Swap roles *(only works when close to the king)* |

- **Shooting doesn't kill.** Your bullets wound, they don't finish. Death is a mercy — and you're not here to be merciful. A hit **staggers** an enemy, slowing them down and buying you space.
- **Guards patrol sight junctions.** When a guard reaches a junction, they scan the corners open to them. If you're there, they chase — and if they reach you, you lose.
- **The king follows his guards.** Shoot him, and he panics — swapping places with a nearby guard and continuing to trail the next one. Every hit makes him harder to reach, not easier.
- **Stealth is the win condition.** Get close, press S, and the roles reverse.

---

## Lore

> *Anyone can be a terror — an assassin, a hitman, a con artist, or even a slave.*

You were royalty once. Your cousin sits on your family's throne, and the kingdom was told *you* were the usurper. You were beaten, disgraced, and enslaved for a crime you didn't commit.

The guards know the truth. That's why they're afraid. If you take the throne, there will be a reckoning — and it will be justified.

But whether you'll be a good king or a bad one? That's not something this story answers.

There is no "happily ever after" here. Only a switch.

---

## Tech

- **Language:** [Nim](https://nim-lang.org/)
- **Library:** [naylib](https://github.com/planetis-m/naylib) (raylib bindings for Nim)
- **Art style:** Primitives only — rectangles, circles, and lines. No external assets.

Built in a week. Assistance from Deepseek (for README.md).

---

## Building

```bash
nimble install naylib
nim c -r -d:release src/main.nim
