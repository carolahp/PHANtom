tests
testAdvicedMembrane1
	| membrane0 membrane1 asp1 pc |
	pc := PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'test';
		context: #('receiver').
	membrane0 := PhMembrane new pointcut: pc.
	membrane1 := PhMembrane new.
	asp1 := PhAspect new
		add:
			(PhAdvice new
				advice: [ :ctx | 
					ctx receiver test: 'advice' ];
				pointcut: pc;
				type: #before); 
				yourself.
	[ 
	asp1 registerOn: membrane1.
	membrane1 advise: membrane0.
	membrane0 install.
	self assert: PhMockClass new test equals: 'advice' ]
		ensure: [ membrane0 uninstall ]