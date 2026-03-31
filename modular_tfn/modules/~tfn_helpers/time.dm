// Until a condition is true or a timeout elapses, honk shoo
#define UNTIL_OR_TIMEOUT(Condition, Timeout) do { var/__end_time = REALTIMEOFDAY + (Timeout); UNTIL((Condition) || (REALTIMEOFDAY > __end_time)); } while(0)
