enum JukeMode
{
	ENTRY = 0,
	FADEIN,
	FADEOUT,
	MAIN,
	EXIT
};

typedef struct
{
	enum JukeMode mode;
} JukeMem;

