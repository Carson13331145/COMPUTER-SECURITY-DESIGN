#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
using namespace std;

int main() {
	string name[500], ip[500];
	char str[1050], str1[20];
	int NAME, IP, line; line = NAME = IP = 0;
	FILE *r = fopen("MResult.txt", "r+");
	FILE *r1 = fopen("VResultPCIP.txt", "r+");
	while (fgets(str, 1024, r) && line < 5064) {
		line++;
		if (str[0] == 'E' && str[1] == 't' && str[2] == 'h') {
			ip[IP] = ""; fgets(str, 1024, r); fgets(str1, 20, r1);
			for (int i = 0; i < 20 && str1[i] != '\n'; i++) ip[IP] += str1[i];
			for (int i = 0; i < 6; i++) fgets(str, 1024, r);
			if (str[0] == '\n') ip[IP] = "";
			else {
				IP++;
				name[NAME] = "";
				for (int i = 4; i < 1024 && str[i] != ' ' && str[i] != '<'; i++) 
					name[NAME] += str[i];
				NAME++;
			}
			line += 7;
		}
	}
	fclose(r); fclose(r1);
	FILE *f = fopen("FResult.txt", "w");
	for (int i = 0; i < IP; i++) {
		string output = ip[i] + ": " + name[i];
		fprintf(f, "%s\n", output.c_str());
	}
	fclose(f);
	return 0;
}
