# Functional Differential Geometry in Julia

This is an in progress implementation, in Julia, of the differential geometry library presented in [Functional Differential Geometry](https://mitpress.mit.edu/books/functional-differential-geometry).

Functional Differential Geometry is from the authors of the famed [Structure and Interpretations of Computer
Programs](https://mitpress.mit.edu/sicp/full-text/book/book.html), and is implemented in Scheme.

### Goals
- get better at differential geometry
- read and learn more functional wizardry
- write more macros
- hopefully apply this to some of the information geometry ideas floating around.

### Status
First part - implementing all Appendix B stuff
- [ ] Tuples
- [ ] Functions
- [ ] Symbolic
- [ ] Differentiation
- [ ] Simplification

### Differential Geometry and Type Systems

The underlying motivation to doing this _in julia_ is that julia is typed, and that, in my mind, one of the difficulties in differential geometry is the implicit typing in the layers of abstractions. I think that's definitely not a coincidence: some key notions of differential geometry, such as pushbacks and pushforwards, also feature prominently in category theory. In turn, category theory directly underlies Haskell's type system. Julia's type system is definitely not Haskell's, but having any kind of type hierarchy will help, I think!
