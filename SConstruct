env = Environment()

# env['ENV']['PATH'] = ['E:/Moo/llvm-mingw-20250305-ucrt-x86_64/bin']
env['ENV']['PATH'] = ['E:/Moo/TDMGCC64/bin']
# -fsanitize=address not work on gcc mingw
# env['BUILDERS']['CustomCC'] = Builder(action='g++ -c -g -Wall -DPDCDEBUG -fsanitize=address  -fno-omit-frame-pointer -o$TARGET $SOURCE')
env['BUILDERS']['CustomCC'] = Builder(action='g++ -c -O2 -Wall -o$TARGET $SOURCE')
env['BUILDERS']['CustomLINK'] = Builder(action='g++ -o$TARGET $SOURCE')

test1o = env.CustomCC(['test1.o'], ['test1.cpp'])
env.Alias('test1o', test1o)

test1e = env.CustomLINK(['test1.exe'], ['test1.o'])
env.Alias('test1e', test1e)

env.Alias('test1', [test1o, test1e])

env.Alias('build', ['test1'])
Default('build')
