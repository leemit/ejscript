static void *opcodeJump[] = {
    &&EJS_OP_ADD,
    &&EJS_OP_ADD_NAMESPACE,
    &&EJS_OP_ADD_NAMESPACE_REF,
    &&EJS_OP_AND,
    &&EJS_OP_ATTENTION,
    &&EJS_OP_BRANCH_EQ,
    &&EJS_OP_BRANCH_STRICTLY_EQ,
    &&EJS_OP_BRANCH_FALSE,
    &&EJS_OP_BRANCH_GE,
    &&EJS_OP_BRANCH_GT,
    &&EJS_OP_BRANCH_LE,
    &&EJS_OP_BRANCH_LT,
    &&EJS_OP_BRANCH_NE,
    &&EJS_OP_BRANCH_STRICTLY_NE,
    &&EJS_OP_BRANCH_NULL,
    &&EJS_OP_BRANCH_NOT_ZERO,
    &&EJS_OP_BRANCH_TRUE,
    &&EJS_OP_BRANCH_UNDEFINED,
    &&EJS_OP_BRANCH_ZERO,
    &&EJS_OP_BRANCH_FALSE_8,
    &&EJS_OP_BRANCH_TRUE_8,
    &&EJS_OP_BREAKPOINT,
    &&EJS_OP_CALL,
    &&EJS_OP_CALL_GLOBAL_SLOT,
    &&EJS_OP_CALL_OBJ_SLOT,
    &&EJS_OP_CALL_THIS_SLOT,
    &&EJS_OP_CALL_BLOCK_SLOT,
    &&EJS_OP_CALL_OBJ_INSTANCE_SLOT,
    &&EJS_OP_CALL_OBJ_STATIC_SLOT,
    &&EJS_OP_CALL_THIS_STATIC_SLOT,
    &&EJS_OP_CALL_OBJ_NAME,
    &&EJS_OP_CALL_SCOPED_NAME,
    &&EJS_OP_CALL_CONSTRUCTOR,
    &&EJS_OP_CALL_NEXT_CONSTRUCTOR,
    &&EJS_OP_CAST,
    &&EJS_OP_CAST_BOOLEAN,
    &&EJS_OP_CLOSE_BLOCK,
    &&EJS_OP_COMPARE_EQ,
    &&EJS_OP_COMPARE_STRICTLY_EQ,
    &&EJS_OP_COMPARE_FALSE,
    &&EJS_OP_COMPARE_GE,
    &&EJS_OP_COMPARE_GT,
    &&EJS_OP_COMPARE_LE,
    &&EJS_OP_COMPARE_LT,
    &&EJS_OP_COMPARE_NE,
    &&EJS_OP_COMPARE_STRICTLY_NE,
    &&EJS_OP_COMPARE_NULL,
    &&EJS_OP_COMPARE_NOT_ZERO,
    &&EJS_OP_COMPARE_TRUE,
    &&EJS_OP_COMPARE_UNDEFINED,
    &&EJS_OP_COMPARE_ZERO,
    &&EJS_OP_DEBUG,
    &&EJS_OP_DEFINE_CLASS,
    &&EJS_OP_DEFINE_FUNCTION,
    &&EJS_OP_DELETE_NAME_EXPR,
    &&EJS_OP_DELETE_SCOPED_NAME_EXPR,
    &&EJS_OP_DIV,
    &&EJS_OP_DUP,
    &&EJS_OP_DUP2,
    &&EJS_OP_DUP_STACK,
    &&EJS_OP_END_CODE,
    &&EJS_OP_END_EXCEPTION,
    &&EJS_OP_GOTO,
    &&EJS_OP_GOTO_8,
    &&EJS_OP_INC,
    &&EJS_OP_INIT_DEFAULT_ARGS,
    &&EJS_OP_INIT_DEFAULT_ARGS_8,
    &&EJS_OP_INST_OF,
    &&EJS_OP_IS_A,
    &&EJS_OP_LOAD_0,
    &&EJS_OP_LOAD_1,
    &&EJS_OP_LOAD_2,
    &&EJS_OP_LOAD_3,
    &&EJS_OP_LOAD_4,
    &&EJS_OP_LOAD_5,
    &&EJS_OP_LOAD_6,
    &&EJS_OP_LOAD_7,
    &&EJS_OP_LOAD_8,
    &&EJS_OP_LOAD_9,
    &&EJS_OP_LOAD_DOUBLE,
    &&EJS_OP_LOAD_FALSE,
    &&EJS_OP_LOAD_GLOBAL,
    &&EJS_OP_LOAD_INT,
    &&EJS_OP_LOAD_M1,
    &&EJS_OP_LOAD_NAMESPACE,
    &&EJS_OP_LOAD_NULL,
    &&EJS_OP_LOAD_REGEXP,
    &&EJS_OP_LOAD_STRING,
    &&EJS_OP_LOAD_THIS,
    &&EJS_OP_LOAD_THIS_LOOKUP,
    &&EJS_OP_LOAD_THIS_BASE,
    &&EJS_OP_LOAD_TRUE,
    &&EJS_OP_LOAD_UNDEFINED,
    &&EJS_OP_LOAD_XML,
    &&EJS_OP_GET_LOCAL_SLOT_0,
    &&EJS_OP_GET_LOCAL_SLOT_1,
    &&EJS_OP_GET_LOCAL_SLOT_2,
    &&EJS_OP_GET_LOCAL_SLOT_3,
    &&EJS_OP_GET_LOCAL_SLOT_4,
    &&EJS_OP_GET_LOCAL_SLOT_5,
    &&EJS_OP_GET_LOCAL_SLOT_6,
    &&EJS_OP_GET_LOCAL_SLOT_7,
    &&EJS_OP_GET_LOCAL_SLOT_8,
    &&EJS_OP_GET_LOCAL_SLOT_9,
    &&EJS_OP_GET_OBJ_SLOT_0,
    &&EJS_OP_GET_OBJ_SLOT_1,
    &&EJS_OP_GET_OBJ_SLOT_2,
    &&EJS_OP_GET_OBJ_SLOT_3,
    &&EJS_OP_GET_OBJ_SLOT_4,
    &&EJS_OP_GET_OBJ_SLOT_5,
    &&EJS_OP_GET_OBJ_SLOT_6,
    &&EJS_OP_GET_OBJ_SLOT_7,
    &&EJS_OP_GET_OBJ_SLOT_8,
    &&EJS_OP_GET_OBJ_SLOT_9,
    &&EJS_OP_GET_THIS_SLOT_0,
    &&EJS_OP_GET_THIS_SLOT_1,
    &&EJS_OP_GET_THIS_SLOT_2,
    &&EJS_OP_GET_THIS_SLOT_3,
    &&EJS_OP_GET_THIS_SLOT_4,
    &&EJS_OP_GET_THIS_SLOT_5,
    &&EJS_OP_GET_THIS_SLOT_6,
    &&EJS_OP_GET_THIS_SLOT_7,
    &&EJS_OP_GET_THIS_SLOT_8,
    &&EJS_OP_GET_THIS_SLOT_9,
    &&EJS_OP_GET_SCOPED_NAME,
    &&EJS_OP_GET_SCOPED_NAME_EXPR,
    &&EJS_OP_GET_OBJ_NAME,
    &&EJS_OP_GET_OBJ_NAME_EXPR,
    &&EJS_OP_GET_BLOCK_SLOT,
    &&EJS_OP_GET_GLOBAL_SLOT,
    &&EJS_OP_GET_LOCAL_SLOT,
    &&EJS_OP_GET_OBJ_SLOT,
    &&EJS_OP_GET_THIS_SLOT,
    &&EJS_OP_GET_TYPE_SLOT,
    &&EJS_OP_GET_THIS_TYPE_SLOT,
    &&EJS_OP_IN,
    &&EJS_OP_LIKE,
    &&EJS_OP_LOGICAL_NOT,
    &&EJS_OP_MUL,
    &&EJS_OP_NEG,
    &&EJS_OP_NEW,
    &&EJS_OP_NEW_ARRAY,
    &&EJS_OP_NEW_OBJECT,
    &&EJS_OP_NOP,
    &&EJS_OP_NOT,
    &&EJS_OP_OPEN_BLOCK,
    &&EJS_OP_OPEN_WITH,
    &&EJS_OP_OR,
    &&EJS_OP_POP,
    &&EJS_OP_POP_ITEMS,
    &&EJS_OP_PUSH_CATCH_ARG,
    &&EJS_OP_PUSH_RESULT,
    &&EJS_OP_PUT_LOCAL_SLOT_0,
    &&EJS_OP_PUT_LOCAL_SLOT_1,
    &&EJS_OP_PUT_LOCAL_SLOT_2,
    &&EJS_OP_PUT_LOCAL_SLOT_3,
    &&EJS_OP_PUT_LOCAL_SLOT_4,
    &&EJS_OP_PUT_LOCAL_SLOT_5,
    &&EJS_OP_PUT_LOCAL_SLOT_6,
    &&EJS_OP_PUT_LOCAL_SLOT_7,
    &&EJS_OP_PUT_LOCAL_SLOT_8,
    &&EJS_OP_PUT_LOCAL_SLOT_9,
    &&EJS_OP_PUT_OBJ_SLOT_0,
    &&EJS_OP_PUT_OBJ_SLOT_1,
    &&EJS_OP_PUT_OBJ_SLOT_2,
    &&EJS_OP_PUT_OBJ_SLOT_3,
    &&EJS_OP_PUT_OBJ_SLOT_4,
    &&EJS_OP_PUT_OBJ_SLOT_5,
    &&EJS_OP_PUT_OBJ_SLOT_6,
    &&EJS_OP_PUT_OBJ_SLOT_7,
    &&EJS_OP_PUT_OBJ_SLOT_8,
    &&EJS_OP_PUT_OBJ_SLOT_9,
    &&EJS_OP_PUT_THIS_SLOT_0,
    &&EJS_OP_PUT_THIS_SLOT_1,
    &&EJS_OP_PUT_THIS_SLOT_2,
    &&EJS_OP_PUT_THIS_SLOT_3,
    &&EJS_OP_PUT_THIS_SLOT_4,
    &&EJS_OP_PUT_THIS_SLOT_5,
    &&EJS_OP_PUT_THIS_SLOT_6,
    &&EJS_OP_PUT_THIS_SLOT_7,
    &&EJS_OP_PUT_THIS_SLOT_8,
    &&EJS_OP_PUT_THIS_SLOT_9,
    &&EJS_OP_PUT_OBJ_NAME_EXPR,
    &&EJS_OP_PUT_OBJ_NAME,
    &&EJS_OP_PUT_SCOPED_NAME,
    &&EJS_OP_PUT_SCOPED_NAME_EXPR,
    &&EJS_OP_PUT_BLOCK_SLOT,
    &&EJS_OP_PUT_GLOBAL_SLOT,
    &&EJS_OP_PUT_LOCAL_SLOT,
    &&EJS_OP_PUT_OBJ_SLOT,
    &&EJS_OP_PUT_THIS_SLOT,
    &&EJS_OP_PUT_TYPE_SLOT,
    &&EJS_OP_PUT_THIS_TYPE_SLOT,
    &&EJS_OP_REM,
    &&EJS_OP_RETURN,
    &&EJS_OP_RETURN_VALUE,
    &&EJS_OP_SAVE_RESULT,
    &&EJS_OP_SHL,
    &&EJS_OP_SHR,
    &&EJS_OP_SPREAD,
    &&EJS_OP_SUB,
    &&EJS_OP_SUPER,
    &&EJS_OP_SWAP,
    &&EJS_OP_THROW,
    &&EJS_OP_TYPE_OF,
    &&EJS_OP_USHR,
    &&EJS_OP_XOR,
    &&EJS_OP_FINALLY,
};
