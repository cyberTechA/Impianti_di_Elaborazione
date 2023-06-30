import os
import sys

if len(sys.argv) < 2:
    print("Usage: python tupling_with_Cwin_mod.py LOG1.TXT CWIN1 [LOG2.TXT CWIN2 ...]")
    sys.exit(1)

while len(sys.argv) > 1:
    log_file = sys.argv[1]
    cwin = int(sys.argv[2])

    fname2 = log_file.replace(".txt", "")
    fname3 = fname2.replace(".txt", "")

    folder = f"tupling_{fname3}-{cwin}"
    os.mkdir(folder)

    interarrivals_filename = f"interarrivals_{fname3}.txt"
    lengths_filename = "lengths.txt"
    starting_points_filename = "startingPoints.txt"

    with open(os.path.join(folder, interarrivals_filename), "w") as interarrivals_file, \
         open(os.path.join(folder, lengths_filename), "w") as lengths_file, \
         open(os.path.join(folder, starting_points_filename), "w") as starting_points_file:

        CWIN = cwin
        TsPrec = 0
        TsSucc = 0
        txcnt = 1
        diffx = 0
        tlen = 0
        first = 0
        ST = 0
        ED = 0

        print(f"*** Grouping the entries for CWIN={CWIN} in {log_file} ***")

        with open(log_file, "r") as file:
            for line in file:
                if first == 0:
                    TsPrec = int(line.split()[0])
                    msg = line.rstrip()
                    with open(os.path.join(folder, f"tuple_{txcnt}.txt"), "w") as tuple_file:
                        tuple_file.write(msg + "\n")
                    first = 1
                    with open(os.path.join(folder, "current.txt"), "w") as current_file:
                        current_file.write(str(txcnt) + "\n")
                else:
                    TsSucc = int(line.split()[0])
                    msg = line.rstrip()
                    diffx = TsSucc - TsPrec

                    if diffx < CWIN:
                        with open(os.path.join(folder, f"tuple_{txcnt}.txt"), "a") as tuple_file:
                            tuple_file.write(msg + "\n")
                    else:
                        # Save data of the "old" tuple
                        interarrivals_file.write(str(diffx) + "\n")
                        with open(os.path.join(folder, f"tuple_{txcnt}.txt"), "r") as old_tuple_file:
                            lines = old_tuple_file.readlines()
                            ST = int(lines[0].split()[0])
                            ED = int(lines[-1].split()[0])
                            tlen = ED - ST
                            lengths_file.write(str(tlen) + "\n")
                            starting_points_file.write(f"{ST} {tlen}\n")

                        print(f"  - creating tuple #{txcnt}")

                        txcnt += 1
                        with open(os.path.join(folder, f"tuple_{txcnt}.txt"), "w") as new_tuple_file:
                            new_tuple_file.write(msg + "\n")
                        with open(os.path.join(folder, "current.txt"), "w") as current_file:
                            current_file.write(str(txcnt) + "\n")

                    TsPrec = TsSucc

        # Last tuple
        txcnt = int(open(os.path.join(folder, "current.txt")).read())
        with open(os.path.join(folder, f"tuple_{txcnt}.txt"), "r") as last_tuple_file:
            lines = last_tuple_file.readlines()
            ST = int(lines[0].split()[0])
            ED = int(lines[-1].split()[0])
            tlen = ED - ST
            lengths_file.write(str(tlen) + "\n")
            starting_points_file.write(f"{ST} {tlen}\n")
      

    sys.argv = sys.argv[2:]

print("Done")
