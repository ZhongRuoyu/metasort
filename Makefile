CXXFLAGS = -std=c++17

example: example.cc
	$(CXX) $(CXXFLAGS) -o $@ $^
