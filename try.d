// Import IO functions to be used
import std.stdio: writef, writeln, readf, readln, write;
import std.string: chomp;

void main()
{
	struct Student
	{
		int index;
		string name;
		double scoreCHS112;
		double scoreCHS132;
		double scoreCHS152;
	}

	Student[] students;
	bool isRunning = true;
	int count = 1;

	while (isRunning)
	{
		 Student student = Student();

		writef("Enter index number of student %s (enter 0 to end program): ", count);
		readf(" %s", &student.index);

		if (student.index == 0) {
		 	isRunning = false; 
		 	continue; // will skip to next loop cycle in while loop
		}

		// Tab is needed due to a bug in readln()  
		writef("Enter name of student %s (press Tab and Enter to resume): ", count);
		student.name = chomp(readln('\t')); // chomp() trims white spaces

		writef("Enter exam score of student %s in CHS132: ", count);
		readf(" %s", &student.scoreCHS112);

		writef("Enter exam score of student %s in CHS112: ", count);
		readf(" %s", &student.scoreCHS132);

		writef("Enter exam score of student %s in CHS152: ", count);
		readf(" %s", &student.scoreCHS152);
        
        students ~= student; // append to students array
        count++;
	}

	foreach(student; students)
	{
		writeln("---- Student ------------");
		writeln("Index: ", student.index);
		writeln("Name: ", student.name);
		writeln ("-- Grades --");
		writeln("CHS112: ", gradeScore(student.scoreCHS112));
		writeln("CHS132: ", gradeScore(student.scoreCHS132));
		writeln("CHS152: ", gradeScore(student.scoreCHS152));
		writeln();
	}
}

string gradeScore(double score)
{
	string grade;

	switch( cast(int)score )
	{
		case 0: .. case 40:
			grade =  "F";
			break;
		case 41: .. case 45:
			grade = "E";
			break;
		case 80: .. case 100:
			grade = "A";
			break;
		default:
			grade = "?";
			break;
	}
	return grade;
}
