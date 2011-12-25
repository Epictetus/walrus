Walrus
======

Goal
----

- Write a mustache templating language that fits more with the idea of view-objects as opposed to view-helpers
- Support method helpers fully. This means:
	- (Semi)-Automatic invocation.
	- "Write what you mean" when it comes to functions.
	- Multiple arguments
	- Arguments may be primitive types
	- Ability to add in custom domain methods at the view object level (how do we do this?)
	- Still support helper methods and block helpers, but put the helper methods where they make the most sense
- Support object paths like handlebars does
- Make it easy to traverse back up to root, and to read as such

- More to come...

Ideas
-----

- `@` means `this`, like in coffeescript. This makes it easy to reference the root object context from anywhere.
-
